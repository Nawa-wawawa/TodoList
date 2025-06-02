document.addEventListener('DOMContentLoaded', () => {
  const dpElement = document.getElementById('datepicker');
  let datetimepicker;

  function initDatepicker() {
    if (!datetimepicker) {
      datetimepicker = new tempusDominus.TempusDominus(dpElement, {
        display: {
          components: {
            calendar: true,
            date: true,
            month: true,
            year: true,
            decades: true,
            clock: false
          }
        },
        localization: {
          format: 'yyyy年MM月dd日',
          locale: 'ja'
        }
      });
    } else {
      datetimepicker.update();  // 既にある場合は更新・再描画
    }
  }

  // モーダル表示時に初期化・再描画
  const modal = document.getElementById('exampleModal');
  modal.addEventListener('shown.bs.modal', () => {
    initDatepicker();
  });
});
