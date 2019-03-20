<?php

namespace App\Console\Commands;

use App\Repositories\Merchant\MerchantRepository;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class BestSellingMerchant extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'carthook:stats:best-selling-merchant';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Best selling merchant of all the merchants';

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
        $results = $merchantRepository->getBestSellingMerchant();

        if (count($results) > 0) {
            $result = $results[0];
            $this->info(sprintf('The best selling merchant of all the merchants is %s %s (%s), they sold a sum of $%.02f',
                $result->first_name, $result->last_name, $result->merchant_id, $result->sales_total_sum));
        } else {
            $this->error("No stats found in the merchants_daily table");
        }
    }
}
