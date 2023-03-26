// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

library SolowMathLibrary {
    struct Point {
        uint256 x;
        uint256 y;
    }

    /***
     * Producto vectorial
     *
     * (a,b) * (c,d) = (a+c),(b+d)
     */
    function vectorialProduct(Point memory a, Point memory b) internal pure returns (Point memory) {
        Point memory result = Point({x: a.x + b.x, y: a.y + b.y});
        return result;
    }

    function vectorialProductStorage(Point storage a, Point memory b) internal returns (Point memory) {
        a.x = a.x + b.x;
        a.y = a.y + b.y;
        return a;
    }

    /***
     * Producto cartesiano
     *
     * (a,b) * (c,d) = {(a*c),(a*d),(b*c),(b*d)}
     */
    function cartesianProduct(Point memory a, Point memory b) internal pure returns (Point[4] memory) {
        Point[4] memory result;
        result[0] = Point({x: a.x, y: b.x});
        result[1] = Point({x: a.x, y: b.y});
        result[2] = Point({x: a.y, y: b.x});
        result[3] = Point({x: a.y, y: b.y});
        return result;
    }
}
