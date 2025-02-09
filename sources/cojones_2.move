module cojones_2::cojones_2{

   use std::string;
   use sui::object::{Self, UID};
   use sui::transfer;
   use sui::tx_context::{Self, TxContext};
   use sui::{clock::Clock, event};


   /// An object that contains an arbitrary string
   struct HelloWorldObject has key, store {
       id: UID,
       /// A string contained in the object
       text: string::String
   }

   struct TimeEvent has copy, drop, store {
       timestamp_ms: u64,
   }

  //public fun timestamp_ms(clock: &Clock): u64 {
  //  clock.timestamp_ms
  // }

   public entry fun mint(ctx: &mut TxContext) {
	
	//let clock = timestamp_ms(0x6);
	//event::emit(TimeEvent { timestamp_ms: clock.timestamp_ms() });

        //let t1=timestamp::now_microseconds();
        //std::debug::print(&t1);
        
        //let t2=timestamp::now_seconds();
        //std::debug::print(&t2);

       let object = HelloWorldObject {
           id: object::new(ctx),
           text: string::utf8(b"Hello World!")
       };
       transfer::public_transfer(object, tx_context::sender(ctx));
   }

}


// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


