<?php
require_once("functions.inc.php");
require_once("db_config.inc.php");
class Kunde{
	private $id;
	private $telefon;
	private $email;
	private $name;
	private $adresse;
	private $db;
	
	public function __construct($id=0)
	{
		$this->db=DB::getDB();
		$this->id=$id;
		if($id != 0)
		{
			load($id);
		}
	}
	public function load($id)
	{
			$stmt=$this->db->prepare("SELECT * FROM kunde WHERE id=:id");
			$stmt->bindValue(":id",$id);
			$error="";
			if($stmt->execute())
			{
				$result=$stmt->fetch();
				if($result)
				{
					//print_r($result);
					$this->telefon=$result["Telefon"];
					$this->email=$result["Email"];
					$this->name=$result["Name"];
					$this->adresse=$result["Adresse"];
				}
				else
				{
					$error.="Leeres Resultat";
				}
			}
			else
			{
				$error.=$stmt->errorInfo()[2];
			}
			if(strlen($error))
			{
				throw new Exception($error);
			}
	}
	public function setValues($telefon, $email, $name, $adresse)
	{
		$this->setTelefon($telefon);
		$this->setEmail($email);
		$this->setName($name);
		$this->setAdresse($adresse);
	}
	public function getId()
	{
		return $this->id;
	}
	public function getTelefon()
	{
		return $this->telefon;
	}
	public function getEmail()
	{
		return $this->email;
	}
	public function getName()
	{
		return $this->name;
	}
	public function getAdresse()
	{
		return $this->adresse;
	}
	
	public function setId($id)
	{
		$this->id=$id;
	}
	public function setTelefon($telefon)
	{
		$this->telefon=$telefon;
	}
	public function setEmail($email)
	{
		if(filter_var($email, FILTER_VALIDATE_EMAIL))
		{
			$this->email=$email;
		}
	}
	public function setName($name)
	{
		$this->name=$name;
	}
	public function setAdresse($adresse)
	{
		$this->adresse=$adresse;
	}
	
	public function update()
	{
		if($this->id != 0)
		{
			$stmt=$this->db->prepare("INSERT INTO kunde (id,telefon,email,name,adresse) VALUES (:id,:telefon,:email,:name,:adresse) 
									  ON DUPLICATE 
									  UPDATE bearbeiter SET telefon=:telefon,email=:email,name=:name,adresse=:adresse WHERE id=:id");
			$stmt->bindValue(":id",$this->id);
		}
		else
		{
			$stmt=$this->db->prepare("INSERT INTO bearbeiter (telefon,email,name,adresse) VALUES (:telefon,:email,:name,:adresse)");
			//TODO:ID setzen nach dem Insert
		}
		$stmt->bindValue(":telefon",$this->telefon);
		$stmt->bindValue(":email",$this->email);
		$stmt->bindValue(":name",$this->name);
		$stmt->bindValue(":adresse",$this->adresse);
		if(!$stmt->execute())
		{
			throw new Exception($stmt->errorInfo()[2]);
		}
	}
	public function get_as_array()
	{
		return array("Id" => $this->getId(),
					 "Telefon" => $this->getTelefon(),
					 "Email" => $this->getEmail(),
					 "Name" => $this->getName(),
					 "Adresse" => $this->getAdresse());
	}
	public function remove()
	{
		$stmt=$this->db->prepare("DELETE FROM kunde WHERE id=:id");
		$stmt->bindValue(":id",$this->id);
		if(!$stmt->execute())
		{
			throw new Exception($stmt->errorInfo()[2]);
		}
	}
	public static function getAllKunden()
	{
		$db=setUpDB();
		
		$stmt=$db->prepare("SELECT * FROM kunde");
		if(!$stmt->execute())
		{
			throw new Exception($stmt->errorInfo()[2]);
		}
		else
		{
			return $stmt->fetchAll();
		}

	}
}