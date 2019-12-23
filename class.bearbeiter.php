<?php
require_once("functions.inc.php");
require_once("db_config.inc.php");
class Bearbeiter
{
	private $id;
	private $telefon;
	private $email;
	private $name;
	private $db;
	
	public function __construct($id=0)
	{
		$this->db=DB::getDB();
		$this->id=$id;

		if($id > 0)
		{
			load($id);
		}
	}
	public function load($id)
	{
		$stmt=$this->db->prepare("SELECT * FROM bearbeiter WHERE id=:id");
		$stmt->bindValue(":id",$id);
		$error="";
		if($stmt->execute())
		{
			$result=$stmt->fetch();
			if($result)
			{
				$this->id=$id;
				$this->telefon=$result->telefon;
				$this->email=$result->email;
				$this->name=$result->name;
			}
			else
			{
				$error.="Leeres Resultset";
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
	public function update()
	{
		if($this->id != 0)
		{
			$stmt=$this->db->prepare("INSERT INTO bearbeiter (id,telefon,email,name) VALUES (:id,:telefon,:email,:name) 
									  ON DUPLICATE 
									  UPDATE bearbeiter SET telefon=:telefon,email=:email,name=:name WHERE id=:id");
			$stmt->bindValue(":id",$this->id);
		}
		else
		{
			$stmt=$this->db->prepare("INSERT INTO bearbeiter (telefon,email,name) VALUES (:telefon,:email,:name)");
		}
		$stmt->bindValue(":telefon",$this->telefon);
		$stmt->bindValue(":email",$this->email);
		$stmt->bindValue(":name",$this->name);
		if(!$stmt->execute())
		{
			throw new Exception($stmt->errorInfo()[2]);
		}
	}
}