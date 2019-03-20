<?php

namespace App\Console\Commands;

use App\Repositories\Funnel\FunnelRepository;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class BestPerformingFunnel extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'carthook:stats:best-performing-funnel';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Best performing funnel for a specific merchant';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @param FunnelRepository $funnelRepository
     * @return mixed
     */
    public function handle(FunnelRepository $funnelRepository)
    {
        $merchantId = $this->ask('Please enter a merchant_id');

        $results = $funnelRepository->getBestPerformingFunnel($merchantId);

        if (count($results) > 0) {
            $result = $results[0];
            $this->info(sprintf('The best performing funnel for the given merchant_id is %s, it sold a sum of $%.02f',
                $result->funnel_id, $result->sales_total_sum));
        } else {
            $this->warn("No stats found for the given merchant_id");
        }
    }
}
