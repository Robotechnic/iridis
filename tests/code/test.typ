#import "../../lib.typ" as iridis

#set page(width: auto, height: auto, margin: 2pt)


#show: iridis.iridis-show

```rs
fn main() {
    let n = false;
    if n {
        println!("Hello, world!");
    } else {
        println!("Goodbye, world!");
    }
}
```

```cpp
#include <iostream>

int main() {
    bool n = false;
    if (n) {
        std::cout << "Hello, world!" << std::endl;
    } else {
        std::cout << "Goodbye, world!" << std::endl;
    }
}
```

```py
if __name__ == "__main__":
    n = False
    if n:
        print("Hello, world!")
    else:
        print("Goodbye, world!")
```
