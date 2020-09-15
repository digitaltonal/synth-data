~makePattern = { arg synthdef,data,repeat;
 var string, mySynthDefs, patternkeys;
 //synthdefs dictionnary
 mySynthDefs = IdentityDictionary.new;
 if (synthdef.isArray)
 { synthdef.do{ arg syn; mySynthDefs.put(syn.name,syn.func.argNames.asArray) } }
 { mySynthDefs.put(synthdef.name,synthdef.func.argNames.asArray) };
 data.collect{ arg voix;
 if (voix.isArray) { voix = voix.asDict };
 if (mySynthDefs.keys.any{arg synthName;
 voix[\instrument].every{ arg synEvntName; synEvntName.asSymbol == synthName.asSymbol} } ){
 //------------------remove bad keys
 patternkeys = mySynthDefs[voix[\instrument][0]] ++ [\delta,\instrument];
 voix.keys.do{ arg key; if( patternkeys.includes(key).not ) { voix.removeAt(key) } };
 voix[\out] = 0.dup(voix[\dur].size);
 //------------------make pattern
 string = "";
 voix.getPairs.clump(2).do{ arg pair,ind;
 var key,value;
 #key,value = pair;
 if (ind == 0)
 { string = string ++ key.cs ++ ", Pseq(%)".format(value.cs) }
 { string = string ++ ", " ++ key.cs ++ ", Pseq(%)".format(value.cs) };
 };
 repeat = repeat ? 1;
 string = "Pn(Pbind(%),%)".format(string,repeat).interpret }
 { "different intruments in the sequence".warn } };
};
