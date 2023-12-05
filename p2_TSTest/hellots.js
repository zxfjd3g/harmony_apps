(function () {
    function greeter(person) {
        return 'Hello, ' + person;
    }
    var user = 'Yee';
    // let user = [] // error
    console.log(greeter(user));
})();
(function () {
    function greeter(person) {
        return 'Hello, ' + person.firstName + ' ' + person.lastName;
    }
    var user = {
        firstName: 'Yee',
        lastName: 'Huang'
    };
    console.log(greeter(user));
})();
(function () {
    var User = /** @class */ (function () {
        function User(firstName, lastName) {
            this.fullName = 'abc';
            this.firstName = firstName;
            this.lastName = lastName;
            this.fullName = firstName + ' ' + lastName;
        }
        return User;
    }());
    function greeter(person) {
        return 'Hello, ' + person.firstName + ' ' + person.lastName;
    }
    var user = new User('Yee', 'Huang');
    console.log(greeter(user));
})();
