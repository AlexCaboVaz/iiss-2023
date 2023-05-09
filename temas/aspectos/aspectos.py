import aspectlib


class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def get_x(self):
        return self.x

    def get_y(self):
        return self.y

    @aspectlib.Aspect
    def set_x(self, x):
        print(f"Setting x to {x}")
        yield aspectlib.Return(self.x)

    @aspectlib.Aspect
    def set_y(self, y):
        print(f"Setting y to {y}")
        yield aspectlib.Return(self.y)


class Line:
    def __init__(self, p1=None, p2=None):
        self.p1 = p1 if p1 is not None else Point()
        self.p2 = p2 if p2 is not None else Point()

    def get_p1(self):
        return self.p1

    def get_p2(self):
        return self.p2

    def set_p1(self, p1):
        self.p1 = p1

    def set_p2(self, p2):
        self.p2 = p2


point = Point()
point.set_x(10)
point.set_y(20)
line = Line()
line.set_p1(point)
line.set_p2(Point(30, 40))

