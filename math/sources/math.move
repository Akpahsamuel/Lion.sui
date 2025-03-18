
/// Module: math
module math::geometry{

//Define a struct Rectangle with fields width and height
    public struct Rectangle has drop{
        width: u64,
        height: u64,

    }
// function to compute the area of a rectangle
   public fun calculate_area(rect: &Rectangle): u64{
    rect.width * rect.height
    }
//function to check if a rectangle is a square
    public fun is_square(rect: &Rectangle): bool{
        rect.width == rect.height
    }

// Test function 
#[test]
 public   fun test_geometry(){
        let rect1 = Rectangle{width:8,height:15};
        let rect2 = Rectangle{width:8,height:8};

// Testing the calculate_area
        assert!(calculate_area(&rect1) == 120, 0x01);
        assert!(calculate_area(&rect2) == 64, 0x02);

// Testing the is_square
        assert!(is_square(&rect1) == false, 0x03);
        assert!(is_square(&rect2) == true, 0x04);
    }



   }



// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


