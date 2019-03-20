<?php

namespace App\Console\Commands;

use App\Repositories\Merchant\MerchantRepository;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class AverageSalesPerDay extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'carthook:stats:average-sales-per-day';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'AVG sales_total per merchant per day';

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
        $results = $merchantRepository->getAverageSalesPerDay();
        $headers = ['First name', 'Last name', 'Merchant ID', 'Daily average'];
        
        if (count($results) > 0) {
            $this->table($headers, json_decode(json_encode($results), 1));
        } else {
            $this->error("No stats found in the merchants_daily table");
        }
    }
}
