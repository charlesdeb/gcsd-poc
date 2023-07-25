import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="timetable-time-slots"
export default class extends Controller {
  // connect() {
  //   console.log(this.element);
  //   console.log('hi from timetable-time-slots');
  // }
  select(event) {
    // console.log('time slot selected');

    const timeSlot =
      event.target.closest('[data-time_slot]')?.dataset.time_slot;

    // console.log({ timeSlot });

    // if there are no sessions for the timeSlot, then there is nothing to do
    if (!this.hasSessions(timeSlot)) {
      return;
    }

    this.selectTimeSlot(timeSlot);
  }
  // Does the timeSlot have any sessions? Breaks don't
  hasSessions(timeSlot) {
    return !!document.querySelector(
      `#timetable-time-slots [data-time_slot_sessions="${timeSlot}"]`
    );
  }
  selectTimeSlot(timeSlot) {
    const selectedBgClass = 'bg-orange-500';

    /** deselect all the time slots */
    document.querySelectorAll('#timetable-time-slots tr').forEach((slot) => {
      slot.classList.remove(selectedBgClass);
      slot.classList.remove('font-bold');
      slot.classList.remove('text-white');
    });

    /** and now select the given one */
    document
      .querySelectorAll(`#timetable-time-slots [data-time_slot="${timeSlot}"]`)
      .forEach((timeSlot) => {
        timeSlot.classList.add(selectedBgClass);
        timeSlot.classList.add('font-bold');
        timeSlot.classList.add('text-white');
      });
  }
}
