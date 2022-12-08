<?php

namespace App\Http\Controllers;

use App\DepotProduit;
use App\Entree;
use App\Produit;
use App\Repositories\ChauffeurRepository;
use App\Repositories\DepotProduitRepository;
use App\Repositories\DepotRepository;
use App\Repositories\EntreeRepository;
use App\Repositories\FactureeRepository;
use App\Repositories\FournisseurRepository;
use App\Repositories\ProduitRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EntreeController extends Controller
{

    protected $entreeRepository;
    protected $fournisseurRepository;
    protected $produitRepository;
    protected $depotRepository;
    protected $depotProduitRepository;

    protected $factureeRepository;

    public function __construct(EntreeRepository $entreeRepository, FournisseurRepository $fournisseurRepository,
    ProduitRepository $produitRepository, DepotRepository $depotRepository,FactureeRepository $factureeRepository,
    DepotProduitRepository $depotProduitRepository){
         $this->middleware(['auth']);
        $this->entreeRepository =$entreeRepository;
        $this->fournisseurRepository = $fournisseurRepository;
        $this->produitRepository = $produitRepository;
        $this->depotRepository = $depotRepository;
        $this->depotProduitRepository = $depotProduitRepository;
        $this->factureeRepository = $factureeRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $entrees = $this->entreeRepository->getAll();
        return view('entree.index',compact('entrees'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $produits = $this->produitRepository->getAll();
        $fournisseurs = $this->fournisseurRepository->getAll();
        $depots = $this->depotRepository->getAll();
        $depotProduits = $this->depotProduitRepository->getByProduitAndDepotByDeport(Auth::user()->depot_id);
        $produit_id=null;
        return view('entree.add',compact('produits','fournisseurs','depots','depotProduits','produit_id'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'fournisseur_id'=> 'required|integer',

        ],[
            'fournisseur_id.required' => 'Fournisseur Obligatoire',
        ]);

        //$request['depot_id']=Auth::user()->depot_id;
        $arrlength = count($request['produit_id']);
        $produits = $request['produit_id'];
        $quantites = $request['quantite'];
        //control if table quantite contains value null
        for($x = 0; $x < $arrlength; $x++) {
            var_dump(is_double($quantites[$x]));
            if(is_numeric($quantites[$x])==false && is_double($quantites[$x])==false){

                return redirect()->back()->with('error','la quantité doit etre un nombre')->withInput();
            }
            if($quantites[$x]==null){
                return redirect()->back()->with('error','Vous avez oublier de renseigner une quantite')->withInput();
            }

        }
        //die();
        if($request->facture){
            $facture = time().'.'.$request->facture->extension();
            $request->facture->move('facture/', $facture);
            $request->merge(['face'=>$facture]);
        }
       $facture =  $this->factureeRepository->store($request->only(['depot_id','chauffeur_id','fournisseur_id','facs','face']));
        for($x = 0; $x < $arrlength; $x++) {
            $entree = new Entree();
            $entree->produit_id = $produits[$x];
            $entree->quantite = $quantites[$x];
            $produit = $this->produitRepository->getById($produits[$x]);
            $entree->prixu = $produit->prixu;
            $entree->facturee_id = $facture->id;
            $entree->save();
            $depotProduit = $this->depotProduitRepository->getByProduitAndDepot($produits[$x],$request['depot_id']);
            $depotProduit->stock = $depotProduit->stock + $quantites[$x];

            DepotProduit::find($depotProduit->id)->update(['stock' =>  $depotProduit->stock]);
        }
       /*  $request['depot_id']=Auth::user()->depot_id;
        if($request->facture){
            $facture = time().'.'.$request->facture->extension();
            $request->facture->move('facture/', $facture);
            $request->merge(['face'=>$facture]);
        }
        $entree = $this->entreeRepository->store($request->all());
        $depotProduit = $this->depotProduitRepository->getByProduitAndDepot($request['produit_id'],$request['depot_id']);
        $depotProduit->stock = $request['quantite'] + $depotProduit->stock;
        DepotProduit::find($depotProduit->id)->update(['stock' =>  $depotProduit->stock]);
        Produit::find($depotProduit->produit_id)->update(['prixu'=>$entree->prixu]);

 */
        return redirect('entree');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $entree = $this->entreeRepository->getById($id);
        return view('entree.show',compact('entree'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $entree = $this->entreeRepository->getById($id);
        $produits = $this->produitRepository->getAll();
        $fournisseurs = $this->fournisseurRepository->getAll();
        $depots = $this->depotRepository->getAll();
        return view('entree.edit',compact('entree','produits','fournisseurs','depots'));
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
        $request['depot_id']=Auth::user()->depot_id;
        $entree = $this->entreeRepository->getById($id);
        $produit = $this->produitRepository->getById($entree->produit_id);
        $request->merge(['prixu'=>$produit->prixu]);
        if($request->facture){
            $facture = time().'.'.$request->facture->extension();
            $request->facture->move('facture/', $facture);
            $request->merge(['face'=>$facture]);
        }
        $this->factureeRepository->update($request['facturee_id'],$request->all());
        $this->entreeRepository->update($id, $request->all());

        $depotProduit = $this->depotProduitRepository->getByProduitAndDepot($request['produit_id'],$request['depot_id']);

        $depotProduit->stock = ($request['quantite'] - $entree->quantite) + $depotProduit->stock;
        DepotProduit::find($depotProduit->id)->update(['stock' =>  $depotProduit->stock]);
        //Produit::find($depotProduit->produit_id)->update(['prixu'=>$request['prixu']]);

        return redirect('entree');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->entreeRepository->destroy($id);
        return redirect('entree');
    }
}
