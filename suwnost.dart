import 'package:test/test.dart';
class Event {
  num id;
  String description;
  DateTime date;
  Event(this.id, this.description, this.date);
}


class Events {
  List <Event>eventsList;
  Events():
  eventsList = [];
  void myAdd(Event someEvent) {
    eventsList.add(someEvent);
  }

  int myTotal() {
    return eventsList.length;
  }

  mySortList(bool ask, num offset, num limit) {
    var someEvents = <Event>[];
    someEvents.addAll(eventsList);
    someEvents.sort((a,b) => a.date.compareTo(b.date));
    if (ask == true) {
    return someEvents.getRange(offset,offset + limit);
    }
    else {
    return someEvents.reversed.toList().getRange(offset,offset + limit);
   }
  }

  Event myReturnById(int someid) {
    return eventsList.firstWhere((i) => i.id == someid); 
  }

  void myRemoveById(int someid) {
    var indexOfEvents = eventsList.lastIndexWhere((i) => i.id == someid);
    eventsList.removeAt(indexOfEvents);
  }
}
void main() {
  var kurazhBazar = Event(456,'Book exhibition',DateTime(2019,2,29));
  var galeryKaras = Event(000,'Photo Studio',DateTime(2019,10,6));
  var act = Events();
  act.myAdd(kurazhBazar);
  act.myAdd(galeryKaras);
  for (var i in act.mySortList(false, 1, 2)){
    print(i.id);
  }
  test("test for myAdd",(){
    var artCentre = Event(123,'Gallery',DateTime(2019,5,12));
    act.myAdd(artCentre);
    bool a = false;
    for (var i in act.eventsList){
      if (i == artCentre){
        a = true;
      }
    }
    expect(true,a);
  });
  test("test for myTotal",(){
    expect(act.eventsList.length,act.myTotal());
  });
  test("test for mySortList",(){
    List a = [];
    expect(a,act.mySortList(true, 0, 0));
  });
  test("test for myReturnById",(){
   var buhtaFoodStation = Event(991,'Food',DateTime(2019,7,10));
   act.myAdd(buhtaFoodStation);
   bool a = false;
   for(var i in act.eventsList){
     if (i.id == buhtaFoodStation.id){
       a = true;
      }
    }
  expect(true,a); 
  });
}