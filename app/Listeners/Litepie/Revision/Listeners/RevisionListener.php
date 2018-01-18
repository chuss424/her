<?php

namespace App\Listeners\Litepie\Revision\Listeners;

use App\Events\Litepie\Revision\Events\RevisionEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class RevisionListener
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
     * @param  RevisionEvent  $event
     * @return void
     */
    public function handle(RevisionEvent $event)
    {
        //
    }
}
