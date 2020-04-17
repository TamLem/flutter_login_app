class Note {

  String title;
  String noteText;

  Note ( {this.title, this.noteText} ); 

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = title;
    map['notetext'] = noteText;
    return map;
  } 

  String toString() {
    return('${this.title} ${this.noteText}');
  }
}