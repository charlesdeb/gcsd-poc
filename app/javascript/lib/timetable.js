/** Functionality for the timetable picker */

import Alpine from 'alpinejs';

const start = function (window) {
  const document = window.document;

  /**
   * Create an Alpine data object so that we can put more complex JS in its
   * methods
   */
  Alpine.data('timetable', () => ({
    state: {
      selectedTimeSlot: null,
    },
    chooseSlot(event) {
      const timeSlot =
        event.target.closest('[data-time_slot]')?.dataset.time_slot;

      // console.log({ timeSlot });

      this.selectTimeSlot(timeSlot);

      if (
        getComputedStyle(
          document.querySelector('.timetable-details-wide')
        ).getPropertyValue('display') == 'block'
      ) {
        this.toggleDetailsWide(timeSlot);
      } else {
        this.toggleArrows(timeSlot);
        this.toggleDetailsNarrow(timeSlot);
      }
    },
    /** does the given timeSlot have any sessions? Breaks don't */
    hasSessions(timeSlot) {
      return !!document.querySelector(
        `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
      );
    },
    selectTimeSlot(timeSlot) {
      const selectedBgClass = 'bg-orange-500';

      /** forst deselect all the time slots */
      document.querySelectorAll('#timetable-time-slots tr').forEach((slot) => {
        slot.classList.remove(selectedBgClass);
        slot.classList.remove('font-bold');
        slot.classList.remove('text-white');
      });

      /** and now select the given one */
      document
        .querySelectorAll(
          `#timetable-time-slots [data-time_slot="${timeSlot}"]`
        )
        .forEach((timeSlot) => {
          timeSlot.classList.add(selectedBgClass);
          timeSlot.classList.add('font-bold');
          timeSlot.classList.add('text-white');
        });
    },
    /** toggle visibility of timeslot sessions on wide screen  */
    toggleDetailsWide(timeSlot) {
      /** hide all the timeslot sessions on the right */
      document
        .querySelectorAll('.timetable-details-wide .time-slot-sessions')
        .forEach((slot) => {
          slot.classList.add('hidden');
          slot.classList.remove('block');
        });

      /** show these timeslot sessions on the right */
      document
        .querySelector(`.timetable-details-wide [data-time_slot="${timeSlot}"]`)
        .classList.replace('hidden', 'block');
    },
    /** toggle visibility of timeslot sessions on narrow screen  */
    toggleDetailsNarrow(timeSlot) {
      if (!this.hasSessions(timeSlot)) {
        /** no sessions for slot, but still ensure all others are closed  */
        this.hideAllDetailsNarrow();
        return;
      }

      if (
        !document
          .querySelector(
            `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
          )
          .classList.contains('hidden')
      ) {
        /** sessions for selected timeSlot already showing, so hide them */
        document
          .querySelector(
            `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
          )
          .classList.add('hidden');
      } else {
        /** user clicked on different timeSlot, so ensure all sessions are hidden */
        this.hideAllDetailsNarrow();

        /** show the sessions for the given timeSlot */
        document
          .querySelector(
            `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
          )
          .classList.remove('hidden');
      }
    },
    /** change the up/down chevrons in narrow view */
    toggleArrows(timeSlot) {
      if (!this.hasSessions(timeSlot)) {
        /** no sessions for slot, but ensure all down arrows are visible */
        this.setAllArrowsDown();
        return;
      }

      if (
        document
          .querySelector(
            `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-up_chevron]`
          )
          .classList.contains('block')
      ) {
        /** user clicked on the selected timeslot, so switch arrows */
        document
          .querySelector(
            `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-up_chevron]`
          )
          .classList.replace('block', 'hidden');

        document
          .querySelector(
            `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-down_chevron]`
          )
          .classList.replace('hidden', 'block');
      } else {
        /** user clicked another timeslot, so ensure all down arrows visible */
        this.setAllArrowsDown();

        /** set arrow for selected timeslot to up */
        document
          .querySelector(
            `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-up_chevron]`
          )
          .classList.replace('hidden', 'block');
        document
          .querySelector(
            `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-down_chevron]`
          )
          .classList.replace('block', 'hidden');

        // this doesn't work unfortunately...
        // document
        //   .querySelectorAll(`tr[data-time_slot="${timeSlot}"] th`)
        //   .forEach((th) => {
        //     th.classList.add('sticky', 'top-4');
        //   });
      }
    },
    setAllArrowsDown() {
      document
        .querySelectorAll('#timetable-time-slots [data-up_chevron]')
        .forEach((upChevron) => {
          upChevron.classList.replace('block', 'hidden');
        });
      document
        .querySelectorAll('#timetable-time-slots [data-down_chevron]')
        .forEach((downChevron) => {
          downChevron.classList.replace('hidden', 'block');
        });
    },
    hideAllDetailsNarrow() {
      document
        .querySelectorAll(`#timetable-time-slots [data-time_slot_sessions]`)
        .forEach((slot) => {
          /** close any visible slots */
          slot.classList.add('hidden');
        });
    },
  }));

  Alpine.data('sessionsSummaryTab', () => ({
    selectedSessionType: null,

    /** highlight the first sessionTupe to show on page load  */
    setup(sessionType) {
      this.selectedSessionType = sessionType;
    },

    chooseSessionType(event) {
      const sessionType = event.target.closest('[data-session_type]')?.dataset
        .session_type;

      this.selectedSessionType = sessionType;

      // unhighlight all tabs
      document
        .querySelectorAll('nav [data-session_type]')
        .forEach((tabHeader) => {
          tabHeader.classList.replace('text-orange-900', 'text-orange-500');
          tabHeader.classList.remove('hover:text-orange-700');
          tabHeader
            .querySelector('span.inset-x-0')
            .classList.replace('bg-orange-800', 'bg-transparent');
        });

      // highlight tab that was just clicked
      document
        .querySelector(`nav [data-session_type="${sessionType}"]`)
        .classList.replace('text-orange-500', 'text-orange-900');
      document
        .querySelector(`nav [data-session_type="${sessionType}"]`)
        .classList.add('hover:text-orange-700');
      document
        .querySelector(
          `nav [data-session_type="${sessionType}"] span.inset-x-0`
        )
        .classList.replace('bg-transparent', 'bg-orange-800');

      return;
    },
  }));
};

export const Timetable = {
  start: start,
};

Timetable.start(window);
