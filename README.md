

# SynthDef and Data


On propose des éléments de contrôle et d’écriture de séquences d’événements dans le temps. Ces événements correspondent à l’exécution de fonctions, pour les clefs et les valeurs qu’ils contiennent. Les données de ces séquences correspondent à des tableaux. 
            
## Modèle

On considère le modèle d’**évènement**, relatif à la description d’un synthétiseur (tels les objets [Event](https://doc.sccode.org/Classes/Event.html) et [Synthdef](https://doc.sccode.org/Classes/SynthDef.html) implémentés dans [SuperCollider](https://supercollider.github.io)

        

Un synthétiseur, ou instrument:
 
	Synthétiseur "instr0" (freq, amp, youpi, dur) { /*...code...*/ }
            
Un évènement:

	[instrument:"instr0", freq: 890, amp: 0.2, youpi: 6.7, dur: 6]        
           
### Tableaux de données

Un tableau de séquence représentera des séquences parallèles. S’il s’agissait d’une séquence de séquences on peut, par concaténation, la transformer comme telle:

Tableau de séquence: 

	[ ['instrument', ['instr0', 'instr0'], 'freq', [600, 880], 'dur', [6, 7]], ['instrument', ['instr0', 'instr0'], 'freq', [450, 850], 'dur', [3, 4]] ]


Concaténation en une séquence:

	[instrument', ['instr0', 'instr0', 'instr0', 'instr0'], 'freq', [600, 880, 450, 850], 'dur', [6, 7, 3, 4]]
              

On propose donc de considérer n’importe quelle séquence comme un **tableau de séquences parallèles**.


#### Exemple:

- [data](https://digitaltonal.com/scd/generative-sound-project/par-seq-0.txt) 
- [synthdef](https://digitaltonal.com/scd/generative-sound-project/synthdef.txt) 


   
### Orchestration, Polymorphisme

L’existence d’instruments aux paramètres analogues permet une variété des synthèses propres aux paramètres d’une séquence (i.e. *orchestration/instrumentation*).

Les paramètres à même de favoriser un tel polymorphisme sont:
                
	[freq, amp (, freq2, amp2, …, freqn, ampn), env, dur, pan].
                
On peut également envisager des traitement exploitant ces données (filtrage etc).
           

## Manipulation de données
        

### Clefs Standards

Voici certaines *valeurs-clés* standard utilisées pour la manipulation des données:


- *instrument* : le ou les instruments
- *delta* : l’intervalle de temps séparant chaque événement consécutif
- *dur* : la durée (propre à l’enveloppe) de chaque événement consécutif
- *offset* : la durée d’un décalage initial
- *durseq* : la durée totale de la séquence
- *seqId* : un numéro de série attribué pour identifier la séquence
- *cut* : un booléen indiquant si, au cas où la durée des enveloppes est supérieure,elles doivent être coupées, afin de correspondre à la durée totale de la séquence durseq


D’autres sont susceptibles d’être utilisées.



### Procédures élémentaires


- **Instrument** : L’instrument n’est pas défini, on attribut un instrument par défaut
- **Valeurs tableau** : Une séquence étant un tableau d’événements, chaque valeur de la séquence sera un tableau dont la taille sera égale au nombre total d’événements
- **Durée** : Si seule la durée d’un événement est définie, alors l’intervalle de temps séparant de l’élément suivant est égal (clé 'delta'). Réciproquement si seul l’intervalle de temps séparant de l’élément suivant est défini alors la durée de l’événement est égale.
- **Fonctions d’extension** : La clé 'durseq' (ou 'durblock') permet l’ajustement de la durée de la séquence par répétition (ou disposition en ordre inversé, ou autre ) de telle manière que la durée totale de la séquence corresponde à la valeur souhaitée.  Par ailleurs, chaque séquence possède une clé qui l’identifie ('seqId') et la date à laquelle est exécuté chaque évènement (‘date’).
- **Montage** : On définit des fonctions permettant la concatenation de séquences ou de tableau de séquences (séquences parallèles) permettant la composition ou le montage de plusieurs séquences, ou tableaux de séquences,  entre-elles. La clé ‘cut’ détermine si la ou les terminaisons des enveloppes d’une séquences sont à tronquer ou non.
- **Remplissage, valeur par défaut** : Au cas où un paramètre, ou la valeur d’un paramètre, est manquante on la remplace par une valeur par défaut sans incidence (comme nil) afin de normaliser les paramètres et le nombre d’événement d’une séquence.
              


### Intégration SuperCollider

Une série de fonctions pour ces manipulations:

- [API library](https://digitaltonal.com/scd/generative-sound-project/api-lib.txt)
- [Exemples & tests](https://digitaltonal.com/scd/generative-sound-project/api-lib-ex.txt)
- [Make Pattern](https://digitaltonal.com/scd/generative-sound-project/makePattern.txt)



## Proposition


Des donnés pouvant être utilisées, ainsi que leur synthétiseur.


N-data : 
- [data-0](https://digitaltonal.com/scd/generative-sound-project/par-seq-0.txt) 
- [data-1](https://digitaltonal.com/scd/generative-sound-project/par-seq-1.txt) 
- [data-2](https://digitaltonal.com/scd/generative-sound-project/par-seq-2.txt) 
- [data-3](https://digitaltonal.com/scd/generative-sound-project/par-seq-3.txt) 


Synthdef:
- [Default Synthdef](https://digitaltonal.com/scd/generative-sound-project/synthdef.txt)


