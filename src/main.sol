pragma solidity 0.8.3;  

contract zylus {
    mapping (address => uint256) public _balances; 
    uint256 constant private MAX_UINT256 = 2**256 - 1;

    mapping (address => mapping (address => uint256)) public _allowances; 

    string _name = "zylus";
    uint8 _decimals = 6;
    string _symbol = "ZYL";
    uint _totalSupply = 100000000000000;
    constructor(uint _initalsupply) public payable {
        _initalsupply = _totalSupply;
        _balances[msg.sender] = _initalsupply;
    }
    

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    

    function name() public view returns (string memory) {
        return _name; 
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function decimals() public view returns (uint8) {
        return _decimals; 
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value)payable public returns (bool success) {
         if (_balances[msg.sender] >= _value && _value > 0) {
            _balances[msg.sender] -= _value;
            _balances[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { 
            return false;
        }
                             
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //same as above. Replace this line with the following if you want to protect against wrapping uints.
        //if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
        if (_balances[_from] >= _value && _allowances[_from][msg.sender] >= _value && _value > 0) {
            _balances[_to] += _value;
            _balances[_from] -= _value;
            _allowances[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns  (uint256 remaining) {
        return(_allowances[_owner][_spender]);
    }

}