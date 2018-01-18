<?php

namespace App\Listeners\Litepie\Calendar\Listeners;

use App\Events\Litepie\Calendar\Events\CalendarEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class CalendarListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  CalendarEvent  $event
     * @return void
     */
    public function handle(CalendarEvent $event)
    {
        //
    }
}
