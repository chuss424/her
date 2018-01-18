<?php

namespace App\Listeners\Litecms\Block\Listeners;

use App\Events\Litecms\Block\Events\BlockEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class BlockListener
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
     * @param  BlockEvent  $event
     * @return void
     */
    public function handle(BlockEvent $event)
    {
        //
    }
}
