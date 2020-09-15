~apiLib = Environment.make{
	~seqAtom = { arg aSequence;
		var wrap_dur_extend = { arg sequence ;
			var deltas = List[], i=0, last;
			var durSeq_target = sequence[\durseq], delta_init = sequence[\delta] ? [durSeq_target];
			while( { deltas.sum < durSeq_target }, { deltas.add( delta_init.wrapAt(i) ); i=i+1 } );
			deltas.pop;
			last = durSeq_target - deltas.sum;
			deltas.add(last);
			sequence[\delta] = deltas.asArray;
			sequence.keysValuesChange{ arg key,value;
				if ( [\durseq, \durblock, \cut].includes(key).not ) {
					if ( value.isArray.not ) { value = [ value ] };
					if ( value.isString ) { value = [ value.asSymbol ] };
					value = value.wrapExtend(deltas.size);
				} { value }
			};
			sequence
		};
		var dur_cut_correction = { arg sequence;
			var timeline;
			timeline = [0] ++ sequence[\delta].integrate;
			timeline.pop;
			sequence[\date] = timeline;
			timeline.do{ arg date, ind;
				if ( sequence[\dur][ind] > (sequence[\delta].sum - date) )
				{ sequence[\dur][ind] = sequence[\delta].sum - date }
			};
			sequence;
		};

		if ( aSequence.isArray ) { aSequence = aSequence.asDict };
		//aSequence[\id] = aSequence[\id] ? 0;
		//if ( aSequence[\instrument].isNil ) { aSequence[\instrument] = \defautlt ; "no instrument define".warn };
		aSequence[\dur] = aSequence[\dur] ? aSequence[\delta];
		aSequence[\delta] = aSequence[\delta] ? aSequence[\dur];
		if ( aSequence[\durblock].notNil ) { aSequence[\durseq] = aSequence[\durblock] };

		aSequence[\durseq] = aSequence[\durseq] ?? {
			aSequence[\dur] = aSequence[\dur].wrapExtend(aSequence[\delta].size);
			aSequence[\delta].pop;
			aSequence[\delta].sum + aSequence[\dur].last
		};
		aSequence = wrap_dur_extend.(sequence: aSequence);

		aSequence[\cut] = aSequence[\cut] ? false;
		if ( aSequence[\cut] ) { aSequence = dur_cut_correction.(sequence: aSequence) } ;
		aSequence.asPairs;

	};


	~normalisation = { arg arrayOfSequences;
		var keys=Set[];
		arrayOfSequences.do{ arg sequence; sequence.asDict.keys.do{ arg key; keys.add(key) } };
		arrayOfSequences.collect{ arg sequence;
			if (sequence.isArray){ sequence = sequence.asDict };
			keys.do{arg key;
				var paddingelement;
				case
				{ "amp".matchRegexp(key.asString) } { paddingelement = 0 }
				{ "vol".matchRegexp(key.asString) } { paddingelement = 0 }
				{ "freq".matchRegexp(key.asString) } { paddingelement = 0 };
				sequence[key] = sequence[key] ? paddingelement.dup(sequence[\delta].size);
			};
			sequence.getPairs
		};
	};

	~concat = { arg arrayOfSequences;
		var sequences,keys=Set[];
		arrayOfSequences = ~normalisation.(arrayOfSequences);
		arrayOfSequences = arrayOfSequences.collect{ arg aSeq; aSeq = ~seqAtom.(aSeq).asDict };
		sequences = arrayOfSequences.flopDict;
		sequences.keysValuesChange{arg key,value; if(value.isArray && value.isString.not){ value.flat} { [value] } };
		sequences[\durseq] = sequences[\durseq].sum;
		sequences[\cut] = sequences[\cut].last;
		sequences[\date] = [0] ++ sequences[\delta].integrate;
		sequences[\date].pop;
		sequences.asPairs
	};


	~paralell = { arg arrayOfSequences, durseq=12, cut=true;
		arrayOfSequences.collect{ arg aSeq;
			aSeq = aSeq.asDict;
			if (durseq.notNil){ aSeq[\durseq] = durseq };
			if (cut.notNil){ aSeq[\cut] = cut };
			~seqAtom.(aSeq)
		};
	};




	~concatparalell = { arg seqOfParallel;
		var depth;
		var padd = { arg parallel;
			var durseq, durOfEmpty;
			var getdelta = { arg parallel; parallel.collect{ arg sequence;
				sequence = sequence.asDict;
				if (sequence[\delta].isArray) { sequence[\delta].sum } { sequence[\delta] }
			}};
			durseq = getdelta.(parallel).select{ arg delta; delta.notNil }.maxItem;
			durOfEmpty  = [delta: [durseq], durseq: durseq, cut:false];
			parallel ++ durOfEmpty.dup(depth - parallel.size)
		};
		depth = seqOfParallel.collect{ arg parallel; parallel.size }.maxItem;

		seqOfParallel.collect{ arg parallel;
			if ( parallel.size < depth ) { padd.(parallel) } { parallel };
		}.flop.collect{ arg arrayOfSequences; ~concat.(arrayOfSequences) };
	};




	~concatdurparalellpairs = { arg seqOfDurParallelPairs,cut=true;
		var durSeqs,seqOfParallel;
		durSeqs = seqOfDurParallelPairs.select{ arg item, ind; ind.even };
		seqOfParallel = seqOfDurParallelPairs.select{ arg item, ind; ind.odd };
		seqOfParallel = seqOfParallel.collect{ arg paralell,ind;
			~paralell.(arrayOfSequences: paralell, durseq: durSeqs[ind], cut: cut);
		};
		~concatparalell.(seqOfParallel);
	};
};




/*

//:::::::::::::::::::::::::::::::::::::: Tests ::::::::::::::::::::::::::::::::::::::

~apiLib.push;

a = [instrument: \synth0, freq: [67,89], dur:[6,7],delta:[1,2],youpi:\argForsynth0,durseq:8,cut:true];
b = [instrument: \synth1, freq2: [67,89], dur:[6,7],delta:[3,2],durseq:8,cut:true];


~seqAtom.value(aSequence: a);
~normalisation.(arrayOfSequences: [a,b]);
~concat.(arrayOfSequences: [a,b,a]).cs;
~paralell.(arrayOfSequences: [a,a,b], durseq:34, cut: true).cs;
~concatparalell.(seqOfParallel: [ [a,a], [a,a,a], [a,a,a,a] ]).cs;
~concatdurparalellpairs.(seqOfDurParallelPairs: [ 23, [b,a], 4, [a,a,b], 16, [b,a,b,a] ], cut: true).cs;


*/