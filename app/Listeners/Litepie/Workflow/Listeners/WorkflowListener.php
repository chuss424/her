<?php

namespace App\Listeners\Litepie\Workflow\Listeners;

use App\Events\Litepie\Workflow\Events\WorkflowEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class WorkflowListener
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
     * @param  WorkflowEvent  $event
     * @return void
     */
    public function handle(WorkflowEvent $event)
    {
        //
    }
}
