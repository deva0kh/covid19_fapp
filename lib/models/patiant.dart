
class Patient {

      int _id;
      String _mac_address;
      int _seconds;
      String _date;
      int _sick =0;


      Patient( this._mac_address, this._seconds, this._date,this._sick
        );

      //Patient.withId(this._id, this._mac_address, this._date, [this._description]);

      int get id => _id;
      String get mac_address => _mac_address;
      int get seconds => _seconds;
      int get sick => _sick;
      String get date => _date;


      set mac_address(String newMac) {
        if (newMac.length <= 255) {
          this._mac_address = newMac;
        }
      }


      set seconds(int newSeconds) {
        _seconds = newSeconds;
      }

      set date(String newDate) {
        this._date = newDate;
      }

      set sick(int newSick)
      {
        this._sick=newSick;
      }

      // Convert  into a Map object
      Map<String, dynamic> toMap() {

        var map = Map<String, dynamic>();
        if (id != null) {
          map['id'] = _id;
        }
        map['mac_address'] = _mac_address;
        map['seconds'] = _seconds;

        map['date'] = _date;
        map['sick']=_sick;

        return map;
      }

      // reverse map object yto patient object
      Patient.fromMapObject(Map<String, dynamic> map) {
        this._id = map['id'];
        this._mac_address = map['mac_address'];
        this._seconds = map['description'];
        this._sick=map['sick'];
        this._date = map['date'];

      }
    }

