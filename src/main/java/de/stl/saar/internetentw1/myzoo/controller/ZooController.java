package de.stl.saar.internetentw1.myzoo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import de.stl.saar.internetentw1.myzoo.database.Database;
import de.stl.saar.internetentw1.myzoo.model.Animal;
import de.stl.saar.internetentw1.myzoo.model.Compound;

import javax.xml.crypto.Data;

/**
 * Der Controller steuert die Navigation innerhalb der Anwendung. Die Methoden
 * geben an, wohin die Navigation beim Aufruf einer bestimmten URL erfolgen soll,
 * nehmen Request-Parameter entgegen, die von Formularen gesendet wurden, und 
 * schreiben neue Parameter in die Requests.
 * @author christopher
 *
 */
@Controller
public class ZooController {
	/* Zum Start ist schon ein bisschen was vorgegeben. Einmal das Mapping für eine Anfrage an / und
	   eine Methode, welche auf die URl zooMap gemappt ist.
	*/
	@RequestMapping("/")
	public String start(Map<String, Object> model) {
		return zooMap(model);
	}
	
	@RequestMapping("zooMap")
	public String zooMap(Map<String, Object> model) {
        model.put("allCompounds", Database.findAllCompounds());
	    return "zooMap";
	}

	@RequestMapping("selectCompound")
    public String getAllCompounds(Map<String, Object> model, String compoundName) {
        if (compoundName == null) {
            model.put("noCompoundSelected", true);
            return zooMap(model);
        }
        model.put("compound", Database.findCompoundByName(compoundName));
	    return goToCompound(model);
    }

    @RequestMapping("goToCompound")
    public String goToCompound(Map<String, Object> model) {
	    return "compound";
    }

    @RequestMapping("selectAnimal")
    public String selectAnimal(Map<String, Object> model, String compoundName, String animalName) {
        model.put("compound", Database.findCompoundByName(compoundName));

	    if (animalName == null) {
            model.put("noAnimalSelected", true);
            return goToCompound(model);
        }

        model.put("animal", Database.findAnimalByName(animalName));
	    return animal(model);
    }

    @RequestMapping("feedAnimal")
    public String feedAnimal(Map<String, Object> model, String compoundName, String animalName) {
	    Animal animal = Database.findAnimalByName(animalName);
	    animal.feed();

	    model.put("compound", Database.findCompoundByName(compoundName));
	    model.put("animal", animal);

	    return "animal";
    }

    @RequestMapping("animal")
    public String animal(Map<String, Object> model) {
	    return "animal";
    }


}
