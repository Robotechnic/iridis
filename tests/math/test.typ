#import "../../lib.typ" as iridis

#set page(width: auto, height: auto, margin: 2pt)


#show: iridis.iridis-show

$
    "plus" equiv lambda m. f lambda n. lambda f. lambda x. m f (n f x) \
    "succ" equiv lambda n. lambda f. lambda x. f (n f x) \
    "mult" equiv lambda m. lambda n. lambda f. lambda x. m (n f) x \
    "pred" equiv lambda n. lambda f. lambda x. n (lambda g. lambda h. h (g f)) (lambda u. x) (lambda u. u) \
    "zero" equiv lambda f. lambda x. x \
    "one" equiv lambda f. lambda x. f x \
    "two" equiv lambda f. lambda x. f (f x) \
    "three" equiv lambda f. lambda x. f (f (f x)) \
    "four" equiv lambda f. lambda x. f (f (f (f x))) \
$

$
    (((1 + 5) * 7) / (5 - 8 * 7) + 3) * 2 approx 4.352941176
$

$ mat(
  1, 2, ..., (10 / 2);
  2, 2, ..., 10;
  dots.v, dots.v, dots.down, dots.v;
  10, (10 - (5 * 8)) / 2, ..., 10;
) $
