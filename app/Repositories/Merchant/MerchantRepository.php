<?php

namespace App\Repositories\Merchant;

use Illuminate\Support\Facades\DB;

class MerchantRepository
{
    public function getBestSellingMerchant()
    {
        return DB::select('
            SELECT 
                SUM(md.sales_total) AS sales_total_sum, 
                md.merchant_id, 
                m.first_name, 
                m.last_name
            FROM merchants_daily md
            JOIN merchant m ON (m.id = md.merchant_id)
            GROUP BY md.merchant_id
            ORDER BY sales_total_sum DESC
            LIMIT 1
        ');
    }

    public function getBestPerformingTimePeriod(int $hours, $merchantId)
    {
        return DB::select('
            SELECT 
                TIME_FORMAT(MIN(analytics_date), "%h:00%p") AS start_hour, 
                TIME_FORMAT(DATE_ADD(MAX(analytics_date), INTERVAL 1 HOUR), "%h:00%p") AS end_hour,
                floor(hour(analytics_date) / ?) AS interval_hours, 
                SUM(sales_total) AS sales_total_sum
            FROM merchants_hourly
            WHERE merchant_id= ?
            GROUP BY interval_hours
            ORDER BY sales_total_sum DESC
            LIMIT 1
        ', [$hours, $merchantId]);
    }

    public function getAverageSalesPerDay()
    {
        return DB::select('
            SELECT 
                m.first_name, 
                m.last_name,
                md.merchant_id,
                AVG(md.sales_total) AS daily_average_sales 
            FROM merchants_daily md
            JOIN merchant m ON (m.id = md.merchant_id)
            GROUP BY merchant_id
            ORDER BY daily_average_sales DESC
        ');
    }
}