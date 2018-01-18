<?php

namespace App\Listeners\Litepie\Alerts\Listeners;

use App\Events\Litepie\Alerts\Events\AlertsEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class AlertsListener
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
     * @param  AlertsEvent  $event
     * @return void
     */
    public function handle(AlertsEvent $event)
    {
        //
    }
}
