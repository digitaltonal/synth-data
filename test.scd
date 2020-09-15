
===
EX1.
===

Instruments

SynthÃ©tiseur "instr0" (freq,amp,freq1,freqC,amp2,xc,youpi) { /*...code...*/ }
SynthÃ©tiseur "instr2" (freq1,freqC,amp,youpi) { /*...code...*/ }
SynthÃ©tiseur "instr3" (freq1,freqC,amp2,xc) { /*...code...*/ }
SynthÃ©tiseur "instr4" (freq1,freq2,amp2,xc) { /*...code...*/ }



Sequence of Events
[
	[instrument:"instr0", freq: [67,890], amp:[0.2], youpi:6.7, dur:6],
	[instrument:"instr2", freq1: [67,890], freqC:[90,889], amp:[0.2], youpi:6.7, dur:6],
	[instrument:"instr3", freq1: 890, freqC:[90,889], amp2:[0.2], xc:0.9 , delta: [6,9] ],
	[instrument:"instr0", freq1: 890, freqC:90, amp2:0.2, xc:0.9 , delta: 6 ],
	[instrument:"instr4", freq1: 890, freq2:[90,889], amp2:[0.2], xc:0.9 , delta: [9,8,2] ]
]
 


Dictionary of the Sequence
[
	'instrument', [ 'instr0', 'instr2', 'instr3', 'instr3', 'instr0', 'instr4', 'instr4', 'instr4' ],
	'freq', [ 67, nil, nil, nil, nil, nil, nil, nil ],
	'freqC', [ nil, 90, 90, 889, 90, nil, nil, nil ],
	'freq1', [ nil, 67, 890, 890, 890, 890, 890, 890 ],
	'freq2', [ nil, nil, nil, nil, nil, 90, 889, 90 ],
	'xc', [ nil, nil, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9 ],
	'amp2', [ nil, nil, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2 ],
	'amp', [ 0.2, 0.2, nil, nil, nil, nil, nil, nil ],
	'youpi', [ 6.7, 6.7, nil, nil, nil, nil, nil, nil ],
	'dur', [ 6, 6, 6, 9, 6, 9, 8, 2 ],
	'delta', [ 6, 6, 6, 9, 6, 9, 8, 2 ],
]


with corrections
[
	'instrument', [ 'instr0', 'instr2', 'instr3', 'instr3', 'instr0', 'instr4', 'instr4', 'instr4' ],
	'freq', [ 67, 0, 0, 0, 0, 0, 0, 0 ],
	'freqC', [ 0, 90, 90, 889, 90, 0, 0, 0 ],
	'freq1', [ 0, 67, 890, 890, 890, 890, 890, 890 ],
	'freq2', [ 0, 0, 0, 0, 0, 90, 889, 90 ],
	'xc', [ nil, nil, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9 ],
	'amp2', [ 0, 0, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2 ],
	'amp', [ 0.2, 0.2, 0, 0, 0, 0, 0, 0 ],
	'youpi', [ 6.7, 6.7, nil, nil, nil, nil, nil, nil ],
	'dur', [ 6, 6, 6, 9, 6, 9, 8, 2 ],
	'delta', [ 6, 6, 6, 9, 6, 9, 8, 2 ],
]




Extraction (at = 6, dur = 7) 
[ 'youpi', [ 6.7, 6.7, nil ], 'freq2', [ 0, 0, 0 ], 'instrument', [ 'instr0', 'instr2', 'instr3' ], 'xc', [ nil, nil, 0.9 ], 'delta', [ 6, 6, 6 ], 'freqC', [ 0, 90, 90 ], 'index', [ 0, 1, 2 ], 'dur', [ 6, 6, 6 ], 'freq', [ 67, 0, 0 ], 'amp2', [ 0, 0, 0.2 ], 'amp', [ 0.2, 0.2, 0 ], 'freq1', [ 0, 67, 890 ] ];

Change [ \xc: [7,89,90] ]
[ 'youpi', [ 6.7, 6.7, nil ], 'freq2', [ 0, 0, 0 ], 'instrument', [ 'instr0', 'instr2', 'instr3' ], 'xc', [ 7, 89, 90 ], 'delta', [ 6, 6, 6 ], 'freqC', [ 0, 90, 90 ], 'index', [ 0, 1, 2 ], 'dur', [ 6, 6, 6 ], 'freq', [ 67, 0, 0 ], 'amp2', [ 0, 0, 0.2 ], 'amp', [ 0.2, 0.2, 0 ], 'freq1', [ 0, 67, 890 ] ]

Insert
[ 'xc', [ 7, 89, 90, 0.9, 0.9, 0.9, 0.9, 0.9 ], 'instrument', [ 'instr0', 'instr2', 'instr3', 'instr3', 'instr0', 'instr4', 'instr4', 'instr4' ], 'dur', [ 6, 6, 6, 9, 6, 9, 8, 2 ], 'freqC', [ 0, 90, 90, 889, 90, 0, 0, 0 ], 'freq', [ 67, 0, 0, 0, 0, 0, 0, 0 ], 'freq1', [ 0, 67, 890, 890, 890, 890, 890, 890 ], 'delta', [ 6, 6, 6, 9, 6, 9, 8, 2 ], 'amp2', [ 0, 0, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2 ], 'freq2', [ 0, 0, 0, 0, 0, 90, 889, 90 ], 'amp', [ 0.2, 0.2, 0, 0, 0, 0, 0, 0 ], 'youpi', [ 6.7, 6.7, nil, nil, nil, nil, nil, nil ] ]



===
EX2.
===


a = [instrument: \synth0, freq: [67,89], dur:[6,7],delta:[1,2],youpi:\argForsynth0,durseq:8,cut:true];
b = [instrument: \synth1, freq2: [67,89], dur:[6,7],delta:[3,2],durseq:8,cut:true];


seqAtom(aSequence: a) = 
[ instrument, [ synth0, synth0, synth0, synth0, synth0, synth0 ], youpi, [ argForsynth0, argForsynth0, argForsynth0, argForsynth0, argForsynth0, argForsynth0 ], durseq, 8, dur, [ 6, 7, 5, 4, 2, 1 ], date, [ 0, 1, 3, 4, 6, 7 ], cut, true, freq, [ 67, 89, 67, 89, 67, 89 ], delta, [ 1, 2, 1, 2, 1, 1 ] ] 

normalisation(arrayOfSequences: [a,b]) = 
[ [ instrument, synth0, youpi, argForsynth0, durseq, 8, dur, [ 6, 7 ], freq2, [ 0, 0 ], cut, true, freq, [ 67, 89 ], delta, [ 1, 2 ] ], [ instrument, synth1, durseq, 8, youpi, [ nil, nil ], dur, [ 6, 7 ], freq2, [ 67, 89 ], cut, true, delta, [ 3, 2 ], freq, [ 0, 0 ] ] ]

concat(arrayOfSequences: [a,b,a]) = 
[ 'delta', [ 1, 2, 1, 2, 1, 1, 3, 2, 3, 1, 2, 1, 2, 1, 1 ], 'dur', [ 6, 7, 5, 4, 2, 1, 6, 5, 3, 6, 7, 5, 4, 2, 1 ], 'freq', [ 67, 89, 67, 89, 67, 89, 0, 0, 0, 67, 89, 67, 89, 67, 89 ], 'date', [ 0, 1, 3, 4, 6, 7, 8, 11, 13, 16, 17, 19, 20, 22, 23 ], 'youpi', [ 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', nil, nil, nil, 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'instrument', [ 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth1', 'synth1', 'synth1', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'durseq', 24, 'freq2', [ 0, 0, 0, 0, 0, 0, 67, 89, 67, 0, 0, 0, 0, 0, 0 ], 'cut', true ]

paralell(arrayOfSequences: [a,a,b], durseq:34, cut: true) =
[ [ 'instrument', [ 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 34, 'dur', [ 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 6, 4, 3, 1 ], 'date', [ 0, 1, 3, 4, 6, 7, 9, 10, 12, 13, 15, 16, 18, 19, 21, 22, 24, 25, 27, 28, 30, 31, 33 ], 'cut', true, 'freq', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67 ], 'delta', [ 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1 ] ], [ 'instrument', [ 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 34, 'dur', [ 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 6, 4, 3, 1 ], 'date', [ 0, 1, 3, 4, 6, 7, 9, 10, 12, 13, 15, 16, 18, 19, 21, 22, 24, 25, 27, 28, 30, 31, 33 ], 'cut', true, 'freq', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67 ], 'delta', [ 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1 ] ], [ 'instrument', [ 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1' ], 'durseq', 34, 'dur', [ 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 6, 4, 1 ], 'freq2', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89 ], 'date', [ 0, 3, 5, 8, 10, 13, 15, 18, 20, 23, 25, 28, 30, 33 ], 'cut', true, 'delta', [ 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 1 ] ] ]

concatparalell(seqOfParallel: [ [a,a], [a,a,a], [a,a,a,a] ]) = 
[ [ 'instrument', [ 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 24, 'dur', [ 6, 7, 5, 4, 2, 1, 6, 7, 5, 4, 2, 1, 6, 7, 5, 4, 2, 1 ], 'date', [ 0, 1, 3, 4, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17, 19, 20, 22, 23 ], 'cut', true, 'delta', [ 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1 ], 'freq', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89 ] ], [ 'instrument', [ 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 24, 'dur', [ 6, 7, 5, 4, 2, 1, 6, 7, 5, 4, 2, 1, 6, 7, 5, 4, 2, 1 ], 'date', [ 0, 1, 3, 4, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17, 19, 20, 22, 23 ], 'cut', true, 'delta', [ 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1 ], 'freq', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89 ] ], [ 'instrument', [ nil, 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ nil, 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 19, 'dur', [ nil, 6, 7, 5, 4, 2, 1, 6, 7, 5, 4, 2, 1 ], 'date', [ 0, 3, 4, 6, 7, 9, 10, 11, 12, 14, 15, 17, 18 ], 'cut', true, 'delta', [ 3, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1 ], 'freq', [ 0, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89 ] ], [ 'instrument', [ nil, nil, 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ nil, nil, 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 14, 'dur', [ nil, nil, 6, 7, 5, 4, 2, 1 ], 'date', [ 0, 3, 6, 7, 9, 10, 12, 13 ], 'cut', true, 'delta', [ 3, 3, 1, 2, 1, 2, 1, 1 ], 'freq', [ 0, 0, 67, 89, 67, 89, 67, 89 ] ] ]

concatdurparalellpairs(seqOfDurParallelPairs: [ 23, [b,a], 4, [a,a,b], 16, [b,a,b,a] ], cut: true) = 
[ [ 'delta', [ 3, 2, 3, 2, 3, 2, 3, 2, 3, 1, 2, 1, 3, 2, 3, 2, 3, 2, 1 ], 'dur', [ 6, 7, 6, 7, 6, 7, 6, 5, 3, 4, 3, 1, 6, 7, 6, 7, 6, 3, 1 ], 'freq', [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 89, 67, 0, 0, 0, 0, 0, 0, 0 ], 'date', [ 0, 3, 5, 8, 10, 13, 15, 18, 20, 23, 24, 26, 27, 30, 32, 35, 37, 40, 42 ], 'durseq', 43, 'instrument', [ 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth0', 'synth0', 'synth0', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1' ], 'youpi', [ nil, nil, nil, nil, nil, nil, nil, nil, nil, 'argForsynth0', 'argForsynth0', 'argForsynth0', nil, nil, nil, nil, nil, nil, nil ], 'freq2', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 0, 0, 0, 67, 89, 67, 89, 67, 89, 67 ], 'cut', true ], [ 'instrument', [ 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'youpi', [ 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'durseq', 43, 'dur', [ 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 5, 4, 2, 1, 4, 3, 1, 6, 7, 6, 7, 6, 7, 6, 6, 4, 3, 1 ], 'date', [ 0, 1, 3, 4, 6, 7, 9, 10, 12, 13, 15, 16, 18, 19, 21, 22, 23, 24, 26, 27, 28, 30, 31, 33, 34, 36, 37, 39, 40, 42 ], 'cut', true, 'freq', [ 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67 ], 'delta', [ 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1 ] ], [ 'freq2', [ 0, 67, 89, 67, 89, 67, 89, 67, 89, 67 ], 'date', [ 0, 23, 26, 27, 30, 32, 35, 37, 40, 42 ], 'instrument', [ nil, 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1', 'synth1' ], 'cut', true, 'delta', [ 23, 3, 1, 3, 2, 3, 2, 3, 2, 1 ], 'durseq', 43, 'dur', [ nil, 4, 1, 6, 7, 6, 7, 6, 3, 1 ] ], [ 'instrument', [ nil, nil, 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0', 'synth0' ], 'durseq', 43, 'youpi', [ nil, nil, 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0', 'argForsynth0' ], 'dur', [ nil, nil, 6, 7, 6, 7, 6, 7, 6, 6, 4, 3, 1 ], 'date', [ 0, 23, 27, 28, 30, 31, 33, 34, 36, 37, 39, 40, 42 ], 'cut', true, 'delta', [ 23, 4, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1 ], 'freq', [ 0, 0, 67, 89, 67, 89, 67, 89, 67, 89, 67, 89, 67 ] ] ]

