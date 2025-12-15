# Eldritch Theme Sample Code

## This file demonstrates the Eldritch theme's syntax highlighting across different languages

### Rust Example
```rust
// A simple Rust function with various syntax elements
use std::collections::HashMap;

/// Documentation comment for the Person struct
#[derive(Debug, Clone)]
pub struct Person {
    name: String,
    age: u32,
    email: Option<String>,
}

impl Person {
    pub fn new(name: String, age: u32) -> Self {
        Person {
            name,
            age,
            email: None,
        }
    }

    pub fn greet(&self) -> String {
        format!("Hello, I'm {} and I'm {} years old!", self.name, self.age)
    }
}

fn main() {
    let mut people = HashMap::new();
    
    let person = Person::new("Alice".to_string(), 30);
    people.insert(1, person);
    
    if let Some(p) = people.get(&1) {
        println!("{}", p.greet());
    }
    
    // Numbers and booleans
    let count = 42;
    let pi = 3.14159;
    let is_active = true;
    
    // Regex pattern
    let pattern = r"^\w+@\w+\.\w+$";
}
```

### Python Example
```python
# Python function showcasing various syntax elements
from typing import List, Optional, Dict
import re

class User:
    """A simple User class"""
    
    def __init__(self, username: str, email: str):
        self.username = username
        self.email = email
        self._id: Optional[int] = None
    
    def validate_email(self) -> bool:
        """Validate email format using regex"""
        pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
        return bool(re.match(pattern, self.email))
    
    def __repr__(self) -> str:
        return f"User(username={self.username}, email={self.email})"

def process_users(users: List[User]) -> Dict[str, User]:
    """Process a list of users and return a dictionary"""
    result = {}
    
    for user in users:
        if user.validate_email():
            result[user.username] = user
        else:
            print(f"Invalid email for user: {user.username}")
    
    return result

# Constants and variables
MAX_USERS = 100
default_timeout = 30.5
is_enabled = True

if __name__ == "__main__":
    users = [
        User("alice", "alice@example.com"),
        User("bob", "invalid-email"),
    ]
    
    valid_users = process_users(users)
    print(f"Found {len(valid_users)} valid users")
```

### JavaScript/TypeScript Example
```typescript
// TypeScript interface and class
interface Config {
    host: string;
    port: number;
    secure: boolean;
    timeout?: number;
}

class ApiClient {
    private config: Config;
    private cache: Map<string, any>;
    
    constructor(config: Config) {
        this.config = config;
        this.cache = new Map();
    }
    
    async fetchData(endpoint: string): Promise<any> {
        // Check cache first
        if (this.cache.has(endpoint)) {
            return this.cache.get(endpoint);
        }
        
        try {
            const url = `${this.config.secure ? 'https' : 'http'}://${this.config.host}:${this.config.port}${endpoint}`;
            const response = await fetch(url);
            const data = await response.json();
            
            // Cache the result
            this.cache.set(endpoint, data);
            return data;
        } catch (error) {
            console.error(`Failed to fetch from ${endpoint}:`, error);
            throw error;
        }
    }
}

// Usage
const config: Config = {
    host: 'api.example.com',
    port: 443,
    secure: true,
    timeout: 5000,
};

const client = new ApiClient(config);
```

### Markdown Features

**Bold text** and *italic text* and ~~strikethrough~~

1. Numbered list item
2. Another item
   - Nested bullet
   - Another bullet

- [x] Completed task
- [ ] Incomplete task

[Link to example](https://example.com)

> A blockquote with some text
> that spans multiple lines

Inline `code` and code blocks shown above.

---

This demonstrates the Eldritch theme's support for:
- Keywords and control flow (if, for, while, etc.)
- Types and interfaces
- Functions and methods
- Variables and constants
- Strings and string interpolation
- Numbers (integers and floats)
- Booleans
- Comments (line and block)
- Operators
- Regex patterns
- Markup elements (headings, lists, links, etc.)
