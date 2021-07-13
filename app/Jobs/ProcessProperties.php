<?php

namespace App\Jobs;

use App\Http\Controllers\ProcessPropertyController;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class ProcessProperties implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // $processor = new ProcessPropertyController();
        // $lastPage = $this->getLastPage();
        // $a = 1;
        // while ($a <= $lastPage) {
        //     $processor->getRecords($a);
        //     $a++;
        // }
        $processor = new ProcessPropertyController();
        $a = 1;
        $next_url = $processor->getRecords($a);
        $this->retrieveData($next_url);
    }

    /**
     * Start importing data based on page
     */
    public function retrieveData($url)
    {
        $processor = new ProcessPropertyController();
        $next_url = $processor->getRecords(1, $url);
        $next_url ?? $this->retrieveData($next_url);
    }

    /**
     * Get last page from API
     * @return int
     */
    public function getLastPage()
    {
        $apiController = new ProcessPropertyController();
        $fetch = $apiController->fetch(1);
        $lastPage = $fetch->last_page;
        return $lastPage;
    }
}
