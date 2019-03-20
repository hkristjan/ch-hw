<?php

namespace App\Console\Commands;

use App\Repositories\Merchant\MerchantRepository;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class BestSellingTimePeriod extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'carthook:stats:best-selling-time-period';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '3 hour time period for specific merchant when he sells most';

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
     * @param MerchantRepository $merchantRepository
     * @return mixed
     */
    public function handle(MerchantRepository $merchantRepository)
    {
        $merchantId = $this->ask('Please enter a merchant_id');
        $results = $merchantRepository->getBestPerformingTimePeriod(3, $merchantId);
        
        if (count($results) > 0) {
            $result = $results[0];
            $this->info(sprintf('The best time period for the given merchant is from %s to %s, they sold a sum  of $%.02f',
                $result->start_hour, $result->end_hour, $result->sales_total_sum));
        } else {
            $this->error("No stats found in the merchants_daily table");
        }
    }
}
