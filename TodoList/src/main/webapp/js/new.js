new tempusDominus.TempusDominus(document.getElementById('datepicker'), {
    display: {
        components: {
            calendar: true,
            date: true,
            month: true,
            year: true,
            decades: true,
            clock: false // ← 時刻表示なし
        },
    },
    localization: {
        format: 'yyyy年MM月dd日',// ← 年→月→日の順に表示
        locale: 'ja' // ← 日本語化
    }
});