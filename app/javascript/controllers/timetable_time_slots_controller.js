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

    if (
      getComputedStyle(
        document.querySelector('.timetable-summaries')
      ).getPropertyValue('display') == 'block'
    ) {
      this.toggleDetailsWide(timeSlot);
    } else {
      this.toggleArrows(timeSlot);
      this.toggleDetailsNarrow(timeSlot);
    }
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

  /** toggle visibility of timeslot sessions on wide screen  */
  toggleDetailsWide(timeSlot) {
    /** hide all the timeslot sessions on the right */
    document
      .querySelectorAll('.timetable-summaries turbo-frame')
      .forEach((slot) => {
        slot.classList.add('hidden');
        slot.classList.remove('block');
      });

    /** show the selected timeslot sessions on the right */
    document
      .querySelector(`.timetable-summaries #${timeSlot}`)
      .classList.replace('hidden', 'block');
  }

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
  }

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
    }
  }

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
  }

  hideAllDetailsNarrow() {
    document
      .querySelectorAll(`#timetable-time-slots [data-time_slot_sessions]`)
      .forEach((slot) => {
        /** close any visible slots */
        slot.classList.add('hidden');
      });
  }
}
