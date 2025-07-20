# Creating EC2 instances using a loop (count)

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region) # Get the correct AMI for the selected region using 'lookup' function
  instance_type = "t2.micro"
  count         = length(var.tags) # Create as many EC2 instances as the number of items in the 'tags' list


  tags = {                                                          # Add tags to each EC2 instance
    Name         = element(var.tags, count.index)                   # Dynamically assign tag "Name" using each item from 'tags' list
    CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp()) # Add a timestamp showing creation time in human-readable format
  }

}



/*

➼ lookup()

  -> lookup() retrieves the value of a single element from a map, given its key. 
  -> If the given key does not exist, the given default value is returned instead.

  lookup(map, key, default)

  -> From my example, 'var.ami' is the map, 'var.region' is the key, and it doesn't have any default
  -> Since, no default value provided here, so if the region value isn't found in the ami map, Terraform will throw an error.
  
➼ length()

  -> It determines the length of a given list, map, or string
  -> If given a list or map, the result is the number of elements in that collection.
  -> If given a string, the result is the number of chracters in the string.

➼ element()

  -> element() retrieves a single element from a list.
  -> The index is zero-based. This function produces an error if used with an empty list. 
  -> The index can be a negative integer.

  element(list, index)

➼ timestamp()

  -> timestamp() returns a UTC timestamp string in RFC 3339 format.


➼ formatdate()

  -> formatdate() can convert the resulting timestamp to other date and time formats.




*/
