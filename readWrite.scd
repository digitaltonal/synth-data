
//==================================================================================================

~fenetre = { arg at, dur, sequence;
	var timeline,i,startInd,endInd;

	if (sequence.isArray) { sequence = sequence.asDict };


	timeline = [0] ++ sequence[\delta].integrate;

	i = 0;
	timeline.pairsDo{ arg date1,date2;
		if ( at.inclusivelyBetween(date1, date2) ) { startInd = i };
		if ( (at+dur).inclusivelyBetween(date1, date2) ) { endInd = i + 1 };
		i = i + 1;
	};

	sequence.keysValuesChange{ arg key, value;
		value.copyRange(startInd,endInd);
	};

	sequence[\index] = (startInd..endInd);
	sequence.getPairs;

};

//==================================================================================================

~reinsertion = { arg segment = e, sequence = a;
	if (sequence.isArray) { sequence = sequence.asDict };
	segment[\index].do{ arg ind;
		sequence.keysValuesChange{ arg key, value;
			value[ind] = segment[key][ind]
		};
	};
	sequence.getPairs;
};

//==================================================================================================

/*a = [ 'xc', [ nil, nil, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9 ], 'instrument', [ 'instr0', 'instr2', 'instr3', 'instr3', 'instr0', 'instr4', 'instr4', 'instr4' ], 'dur', [ 6, 6, 6, 9, 6, 9, 8, 2 ], 'freq1', [ 0, 67, 890, 890, 890, 890, 890, 890 ], 'freqC', [ 0, 90, 90, 889, 90, 0, 0, 0 ], 'freq', [ 67, 0, 0, 0, 0, 0, 0, 0 ], 'delta', [ 6, 6, 6, 9, 6, 9, 8, 2 ], 'amp2', [ 0, 0, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2 ], 'freq2', [ 0, 0, 0, 0, 0, 90, 889, 90 ], 'amp', [ 0.2, 0.2, 0, 0, 0, 0, 0, 0 ], 'youpi', [ 6.7, 6.7, nil, nil, nil, nil, nil, nil ] ];

//extrait
e = ~fenetre.(at: 6, dur: 7, sequence: a);
//changement
e = e.asDict; e.put(\xc,[7,89,90]);
//==================================================================================================
~reinsertion.(segment: e, sequence: a).cs;*/

