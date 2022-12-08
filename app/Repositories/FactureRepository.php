<?php

namespace App\Repositories;

use App\Facture;

class FactureRepository extends RessourceRepository{
    public function __construct(Facture $facture)
    {
        $this->model = $facture;
    }

    public function getFactureByDepot($depot_id){
        return Facture::with(['client','depot'])
        ->where('depot_id',$depot_id)
        ->orderBy('id','desc')
        ->get();
    }
    public function getFactureBetweenToDate($debut,$fin,$depot_id){
        return Facture::with(['client','depot'])
        ->where('depot_id',$depot_id)
        ->whereBetween('created_at',[$debut,$fin])
        ->get();
    }
}
