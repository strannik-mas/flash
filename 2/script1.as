str = "DuplicateMovieClip";
_root.onMouseDown = strong;

for(i=0;i<str.length;i++){
	t = str.charAt(i);
	def = as_mc.duplicateMovieClip("as_mc"+i, i+1);
	def.as_txt.text = t;
	def._x = Math.random()*Stage.width;
	def._y = Math.random()*Stage.height;
	def._rotation = Math.random()*360;
	def.onEnterFrame = myf;
}
function strong(){
	
	for(i=0;i<str.length;i++){
		def = eval("as_mc"+i);
		def.ym = 50;
		def.xm = 20*i;
		def.onEnterFrame = goLine;
	}
}

function goLine(){
	this._x += (this.xm-this._x)/10;
	this._y += (this.ym-this._y)/10;
	this._rotation += (0-this._rotation)/10;
}

function myf(){
	this._x += (_xmouse-this._x)/10;
	this._y += (_ymouse-this._y)/10;
}









