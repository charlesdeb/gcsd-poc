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

      const selectedBgClass = 'bg-orange-500';

      const timeSlot = event.target.parentElement.dataset.time_slot;
      // console.log({ timeSlot });

      /** hide all the other timeslot sessions */
      document
        .querySelectorAll('.timetable-details .time-slot-sessions')
        .forEach((slot) => {
          slot.classList.add('hidden');
          slot.classList.remove('flex-col');
        });

      /** show this one */
      document
        .querySelector(`.timetable-details [data-time_slot="${timeSlot}"]`)
        .classList.replace('hidden', 'flex-col');

      /** deselect all the time slots */
      document.querySelectorAll('#timetable-time-slots tr').forEach((slot) => {
        slot.classList.remove(selectedBgClass);
        slot.classList.remove('font-bold');
        slot.classList.remove('text-white');
      });

      /** select this one */
      document
        .querySelectorAll(
          `#timetable-time-slots [data-time_slot="${timeSlot}"]`
        )
        .forEach((slot) => {
          slot.classList.add(selectedBgClass);
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
