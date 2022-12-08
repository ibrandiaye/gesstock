<?php

namespace App\Mail;

use App\DepotProduit;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OutStockMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    protected $depotProduit;
    public function __construct( $depotProduit)
    {
        $this->depotProduit = $depotProduit;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('ibrandiaye@endaecopop.org')
        ->subject('Produit en Rupture de Stock')
        ->view('emails.outstock')->with([
            'depotProduits' => $this->depotProduit
        ]);
    }
}
