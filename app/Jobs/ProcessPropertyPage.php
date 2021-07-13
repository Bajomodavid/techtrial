<?php

namespace App\Jobs;

use App\Http\Controllers\ProcessPropertyController;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class ProcessPropertyPage implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * The Property API page to process
     * @var int
     */

    protected $page;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(int $page)
    {
        $this->page = $page;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $processor = new ProcessPropertyController();
        $processor->getRecords($this->page);
    }
}
