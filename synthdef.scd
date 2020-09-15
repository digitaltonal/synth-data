///////////////////////////////////*SynthDef*///////////////////////////////////
[
	SynthDef('mySynth-1',{arg out=0,freq,amp,dur,curve,pan,vol;
		var sig;
		sig=EnvGen.kr(Env([0,1,0],[dur,0.02],curve),doneAction:2);
		sig=SinOsc.ar(freq,0,amp) * sig;
		sig=Pan2.ar(sig,pan,vol);
		Out.ar(out,sig)
	}),


	SynthDef('mySynth-2',{arg out=0,freq,amp,car,mod,caramp,modamp,dur,curve,pan,vol;
		var env,sig,ringsig;
		env=EnvGen.kr(Env([0,1,0],[dur,0.02],curve),doneAction:2);
		ringsig = SinOsc.ar(car,0,caramp) * SinOsc.ar(mod,0,modamp);
		sig = SinOsc.ar(freq,0,amp).ring1(ringsig);
		//sig = ([sig, ringsig]);
		sig = sig * env;
		sig=Pan2.ar(sig,pan,vol);
		Out.ar(out,sig)
	})
]
.do{ arg synd; synd.add} 