<?php

namespace App\Http\Controllers;

use App\DepotProduit;
use App\Repositories\CategorieRepository;
use App\Repositories\DepotProduitRepository;
use App\Repositories\DepotRepository;
use App\Repositories\ProduitRepository;
use Illuminate\Http\Request;

class ProduitController extends Controller
{

    protected $produitRepository;
    protected $depotRepository;

    protected $depotProduitRepository;
    protected $categorieRepository;

    public function __construct(ProduitRepository $produitRepository,
    DepotRepository $depotRepository, DepotProduitRepository $depotProduitRepository,
    CategorieRepository $categorieRepository){
        $this->middleware(['auth']);
        $this->produitRepository =$produitRepository;
        $this->depotProduitRepository = $depotProduitRepository;
        $this->depotRepository = $depotRepository;
        $this->categorieRepository = $categorieRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $produits = $this->produitRepository->getAll();
        return view('produit.index',compact('produits'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = $this->categorieRepository->getAll();
        return view('produit.add',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $produit = $this->produitRepository->store($request->all());
        $depots = $this->depotRepository->getAll();
        foreach ($depots as $depot) {
            $depotProduit = new DepotProduit();
            $depotProduit->produit_id= $produit->id;
            $depotProduit->depot_id = $depot->id;
            $depotProduit->stock = 0;
            $depotProduit->save();
        }
        return redirect('produit');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $produit = $this->produitRepository->getById($id);
        return view('produit.show',compact('produit'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = $this->categorieRepository->getAll();
        $produit = $this->produitRepository->getById($id);
        return view('produit.edit',compact('produit','categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->produitRepository->update($id, $request->all());
        return redirect('produit');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->produitRepository->destroy($id);
        return redirect('produit');
    }
}
