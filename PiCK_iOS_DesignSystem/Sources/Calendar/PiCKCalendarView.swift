import SwiftUI

public enum CalendarType {
    case schoolMeal
    case selfStudy
}

public struct PiCKCalendarView: View {
    private let calendarType: CalendarType
    @Binding private var selectedDate: Date
    @Binding private var currentPage: Date
    @Binding private var isWeekMode: Bool

    let topToggleButtonTapped: () -> Void
    let bottomToggleButtonTapped: () -> Void
    let dateSelected: (Date) -> Void

    private let calendar = Calendar.current
    private let weekSymbols = ["일", "월", "화", "수", "목", "금", "토"]

    private let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "ko_KR")
        f.dateFormat = "yyyy년 M월"
        return f
    }()

    public init(
        calendarType: CalendarType,
        selectedDate: Binding<Date>,
        currentPage: Binding<Date>,
        isWeekMode: Binding<Bool>,
        topToggleButtonTapped: @escaping () -> Void = {},
        bottomToggleButtonTapped: @escaping () -> Void = {},
        dateSelected: @escaping (Date) -> Void = { _ in }
    ) {
        self.calendarType = calendarType
        self._selectedDate = selectedDate
        self._currentPage = currentPage
        self._isWeekMode = isWeekMode
        self.topToggleButtonTapped = topToggleButtonTapped
        self.bottomToggleButtonTapped = bottomToggleButtonTapped
        self.dateSelected = dateSelected
    }

    public var body: some View {
        VStack(spacing: 12) {
            if calendarType == .selfStudy {
                Button(action: {
                    withAnimation(.easeInOut) {
                        if !isWeekMode {
                            currentPage = selectedDate
                        }
                        isWeekMode.toggle()
                    }
                    topToggleButtonTapped()
                }) {
                    (isWeekMode ? PiCKImage.topArrow : PiCKImage.bottomArrow)
                        .foregroundStyle(Color.Primary.primary500)
                }
            }

            HStack (spacing: 16) {
                if !isWeekMode {
                    Button(action: previousMonth) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.Normal.black)
                    }
                }

                Text(dateFormatter.string(from: currentPage))
                    .pickText(type: .label1, textColor: Color.Normal.black)
                    .foregroundColor(.primary)

                if !isWeekMode {
                    Button(action: nextMonth) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.Normal.black)
                    }
                }
            }
            .padding(.horizontal, 4)

            HStack(spacing: 0) {
                ForEach(weekSymbols, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 13, weight: .medium))
                        .frame(maxWidth: .infinity)
                }
            }

            calendarGrid

            if calendarType == .schoolMeal {
                Button(action: {
                    withAnimation(.easeInOut) {
                        if !isWeekMode {
                            currentPage = selectedDate
                        }
                        isWeekMode.toggle()
                    }
                    bottomToggleButtonTapped()
                }) {
                    (isWeekMode ? PiCKImage.bottomArrow : PiCKImage.topArrow)
                        .foregroundStyle(Color.Primary.primary500)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        .background(Color(.systemBackground))
        .clipShape(
            RoundedCorner(
                radius: 20,
                corners: calendarType == .schoolMeal
                    ? [.bottomLeft, .bottomRight]
                    : [.topLeft, .topRight]
            )
        )
    }

    private var calendarGrid: some View {
        let allDates = generateDates(for: currentPage)
        let visibleDates = isWeekMode ? weekDates(from: selectedDate, in: allDates) : allDates
        let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 7)

        return LazyVGrid(columns: columns, spacing: 4) {
            ForEach(visibleDates, id: \.self) { date in
                let isCurrentMonth = calendar.isDate(date, equalTo: currentPage, toGranularity: .month)
                let isSelected = date.isSameDay(as: selectedDate)
                let isToday = calendar.isDateInToday(date)

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedDate = date
                    }
                }) {
                    ZStack {
                        if isToday {
                            Circle()
                                .fill(Color.Primary.primary100)
                                .frame(width: 32, height: 32)
                        }
                        
                        if isSelected {
                            Circle()
                                .stroke(Color.Primary.primary100, lineWidth: 1)
                                .frame(width: 32, height: 32)
                        }

                        Text("\(calendar.component(.day, from: date))")
                            .font(.system(size: 14))
                            .foregroundColor(isCurrentMonth ? .primary : .secondary)
                            .frame(width: 32, height: 32)
                    }
                    .frame(minWidth: 44, minHeight: 44)
                }
                .buttonStyle(.plain)
                .simultaneousGesture(TapGesture().onEnded {
                    dateSelected(date)
                })
            }
        }
        .frame(height: isWeekMode ? 48 : 264)
    }

    private func generateDates(for month: Date) -> [Date] {
        let range = calendar.range(of: .day, in: .month, for: month)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        let startWeekday = calendar.component(.weekday, from: startOfMonth)
        let leadingEmptyDays = (startWeekday - calendar.firstWeekday + 7) % 7

        var dates: [Date] = []
        for i in 0..<leadingEmptyDays {
            if let date = calendar.date(byAdding: .day, value: -(leadingEmptyDays - i), to: startOfMonth) {
                dates.append(date)
            }
        }

        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                dates.append(date)
            }
        }
        let totalDays = dates.count
        let remainingDays = 7 - (totalDays % 7)
        if remainingDays < 7, let lastDate = dates.last {
            for i in 1...remainingDays {
                if let date = calendar.date(byAdding: .day, value: i, to: lastDate) {
                    dates.append(date)
                }
            }
        }

        return dates
    }

    private func weekDates(from selected: Date, in allDates: [Date]) -> [Date] {
        guard let index = allDates.firstIndex(where: { $0.isSameDay(as: selected) }) else { return Array(allDates.prefix(7)) }
        let weekStart = (index / 7) * 7
        return Array(allDates[weekStart..<min(weekStart + 7, allDates.count)])
    }

    private func previousMonth() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if let prev = calendar.date(byAdding: .month, value: -1, to: currentPage) {
                currentPage = prev
            }
        }
    }

    private func nextMonth() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if let next = calendar.date(byAdding: .month, value: 1, to: currentPage) {
                currentPage = next
            }
        }
    }
}

private extension Date {
    func isSameDay(as other: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: other)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedDate = Date()
        @State private var currentPage = Date()
        @State private var isWeekMode = true
        
        var body: some View {
            ZStack {
                
                VStack {
                    Spacer()
                    ZStack {
                        if !isWeekMode {
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                                .allowsHitTesting(false)
                        }
                        VStack {
                            PiCKCalendarView(
                                calendarType: .schoolMeal,
                                selectedDate: $selectedDate,
                                currentPage: $currentPage,
                                isWeekMode: $isWeekMode
                            )
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    return PreviewWrapper()
}
