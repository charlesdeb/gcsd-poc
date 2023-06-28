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
      // console.log({ event });

      const selectedBgClass = 'bg-orange-500';

      const timeSlot =
        event.target.closest('[data-time_slot]')?.dataset.time_slot;
      console.log({ timeSlot });

      if (
        !document.querySelector(
          `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
        )
      ) {
        /** no sessions for the time-slot, so do nothing */
        console.log('no sessions');
        return;
      }

      /** deselect all the time slots */
      document.querySelectorAll('#timetable-time-slots tr').forEach((slot) => {
        slot.classList.remove(selectedBgClass);
        slot.classList.remove('font-bold');
        slot.classList.remove('text-white');
      });

      /** select this timeslot */
      document
        .querySelectorAll(
          `#timetable-time-slots [data-time_slot="${timeSlot}"]`
        )
        .forEach((slot) => {
          console.log('selecting');
          console.log({ slot });

          slot.classList.add(selectedBgClass);
          slot.classList.add('font-bold');
          slot.classList.add('text-white');
        });

      if (
        getComputedStyle(
          document.querySelector('.timetable-details')
        ).getPropertyValue('display') == 'block'
      ) {
        /** hide all the timeslot sessions on the right */
        document
          .querySelectorAll('.timetable-details .time-slot-sessions')
          .forEach((slot) => {
            slot.classList.add('hidden');
            slot.classList.remove('block');
          });

        /** show these timeslot sessions on the right */
        document
          .querySelector(`.timetable-details [data-time_slot="${timeSlot}"]`)
          .classList.replace('hidden', 'block');
      } else {
        /** change the up/down chevrons */
        if (
          document
            .querySelector(
              `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-up_chevron]`
            )
            .classList.contains('block')
        ) {
          /** user clicked on the selected timeslot, so switch arrows */
          console.log('clicked open slot');
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
          /** user clicked another timeslot */
          console.log('clicked closed slot');

          /** set all arrows to down */
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

          /** set selected timeslot arrow to up */
          document
            .querySelector(
              `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-up_chevron]`
            )
            ?.classList.replace('hidden', 'block');
          document
            .querySelector(
              `#timetable-time-slots [data-time_slot="${timeSlot}"] [data-down_chevron]`
            )
            ?.classList.replace('block', 'hidden');
          // document
          //   .querySelectorAll(`tr[data-time_slot="${timeSlot}"] th`)
          //   .forEach((th) => {
          //     th.classList.add('sticky', 'top-4');
          //   });
        }

        /** toggle/select these timeslot sessions narrow view  */
        if (
          !document
            .querySelector(
              `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
            )
            .classList.contains('hidden')
        ) {
          /** sessions already showing, so hide them */
          document
            .querySelector(
              `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
            )
            .classList.add('hidden');
        } else {
          /** user clicked on a hidden set of sessions */
          document
            .querySelectorAll(`#timetable-time-slots [data-time_slot_sessions]`)
            .forEach((slot) => {
              /** close any visible slots */
              slot.classList.add('hidden');
            });
          /** show the one they clicked  */
          document
            .querySelector(
              `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
            )
            .classList.remove('hidden');
        }
      }
    },
  }));
};

export const Timetable = {
  start: start,
};

Timetable.start(window);
