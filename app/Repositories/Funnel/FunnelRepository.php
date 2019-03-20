<?php

namespace App\Repositories\Funnel;

use Illuminate\Support\Facades\DB;

class FunnelRepository
{
    public function getBestPerformingFunnel($merchantId)
    {
        return DB::select('
            SELECT SUM(sales_total) AS sales_total_sum, funnel_id
            FROM funnels_daily
            WHERE merchant_id = ?
            GROUP BY funnel_id
            ORDER BY sales_total_sum DESC
        ', [$merchantId]);
    }
}