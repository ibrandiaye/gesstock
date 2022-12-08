<?php

namespace App\Repositories;

use App\Facturee;

class FactureeRepository extends RessourceRepository{
    public function __construct(Facturee $facturee)
    {
        $this->model = $facturee;
    }
    public function getFactiureeBetweenToDate($debut,$fin,$depot_id){
        return Facturee::with(['entrees','fournisseur'])
        ->where('depot_id',$depot_id)
        ->whereBetween('created_at',[$debut,$fin])
        ->get();
    }
}
