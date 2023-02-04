/** Functionality for the timetable picker */

import Alpine from 'alpinejs';

const start = function (window) {
  const document = window.document;

  /**
   * Create an Alpine data object so that we can put more complex JS in its
   * methods
   */
  Alpine.data('timetable', () => ({
    chooseSlot(event) {
      // console.log({ event });

      const timeSlot = event.target.dataset.time_slot;
      // console.log({ timeSlot });

      /** hide all the other timeslot sessions */
      document
        .querySelectorAll('.timetable-details .time-slot-sessions')
        .forEach((slot) => {
          slot.classList.add('hidden');
        });

      /** show this one */
      document
        .querySelector(`.timetable-details [data-time_slot="${timeSlot}"]`)
        .classList.remove('hidden');

      /** deselect all the time slots */
      document
        .querySelectorAll('.timetable-time-slots .grid div')
        .forEach((slot) => {
          slot.classList.remove('bg-orange-400');
          slot.classList.remove('font-bold');
          slot.classList.remove('text-white');
        });

      /** select this one */
      document
        .querySelectorAll(
          `.timetable-time-slots [data-time_slot="${timeSlot}"]`
        )
        .forEach((slot) => {
          slot.classList.add('bg-orange-400');
          slot.classList.add('font-bold');
          slot.classList.add('text-white');
        });
    },
  }));
};

export const Timetable = {
  start: start,
};

Timetable.start(window);
