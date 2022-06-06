<?php

namespace App\Models;

use App\Core\Db;

class Model extends Db
{
    //instance de la table
    protected $table;

    //instance de la db
    private $db;
    /**
     * CRUD
     * cette methode renvoi tous les elements
     */
    public function findAll()
    {
        $query = $this->q('SELECT * FROM ' . $this->table);
        return $query->fetchAll();
    }
    /**
     * cette fonction renvoi tous les elements selon le tabeaux de criteres
     * passé en parametre
     * @param array $criteres
     */
    public function findBy(array $criteres)
    {
        $champs = [];
        $valeurs = [];
        foreach ($criteres as $champ => $valeur) {
            $champs[] = " $champ = ? ";
            $valeurs[] = $valeur;
        }
        $lst_champs = implode('AND', $champs);
        $sql = "SELECT * FROM $this->table WHERE $lst_champs";
        $tab = $this->q($sql, $valeurs);
        return $tab->fetchAll();
    }

    /**
     * cette methode renvoi un element a partir de son identifiant
     * @param int $id
     * @return object
     */
    public function find(int $id): object
    {
        $sql = "SELECT * FROM $this->table WHERE id = ?";
        $tab = $this->q($sql, [$id]);
        $tab = $tab->fetch();
        return $tab;
    }

    public function create(): void
    {
        $valeurs = [];
        $champs = [];
        $inter = [];

        foreach ($this as $champ => $valeur) {
            if ($valeur !== null && $champ != 'db' && $champ != 'table') {
                $champs[] = $champ;
                $valeurs[] = $valeur;
                $inter[] = "?";
            }
        }
        $lst_champs = implode(', ', $champs);
        $lst_inter = implode(', ', $inter);
        $sql = "INSERT INTO $this->table ($lst_champs) VALUES ($lst_inter)";
        $this->q($sql, $valeurs);
    }

    public function update(int $id, Model $model): void
    {
        $champs = [];
        $valeurs = [];
        foreach ($model as $champ => $valeur) {
            if ($valeur !== null && $champ !== 'db' && $champ !== 'table') {
                $champs[] = "$champ = ?";
                $valeurs[] = $valeur;
            }
        }
        $valeurs[] = $id;
        $lst_champs = implode(', ', $champs);
        $sql = "UPDATE $this->table SET $lst_champs WHERE id = ?";
        $this->q($sql, $valeurs);
    }

    protected function q(string $sql, array $attributs = null)
    {
        //on recupere l'instance de Db
        $this->db = Db::getInstance();
        if ($attributs !== null) {
            $query = $this->db->prepare($sql);
            $query->execute($attributs);
            return $query;
        } else {
            return $this->db->query($sql);
        }
    }

    public function hydrate($data): self
    {
        foreach ($data as $key => $val) {
            $setter = 'set' . ucfirst($key);
            if (method_exists($this, $setter)) {
                $this->$setter($val);
            }
        }
        return $this;
    }
}
