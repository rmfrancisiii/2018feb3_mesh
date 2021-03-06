// stringRes synth, Robert
SynthDef(\stringRes, {
	|out=0,
	startfreq=1,
	endfreq=20,
	len=1,
	t_gate=1,
	res=0.9,
	amp=0,
	att=0.2,
	dec=0.6,
	sus=1,
	attime=0.2,
	dectime=0.2,
	sustime=0.3,
	reltime=0.4|
	Out.ar(out, Streson.ar(WhiteNoise.ar,
	EnvGen.kr(Env([startfreq, startfreq, endfreq], [0, len], 'exp'), t_gate, doneAction: 0).reciprocal, res, amp) *
	EnvGen.ar(Env([0, 0, att, dec, sus, 0], [attime, dectime, sustime, reltime].normalizeSum*len, 'lin'), t_gate, doneAction: 0))
}).add;