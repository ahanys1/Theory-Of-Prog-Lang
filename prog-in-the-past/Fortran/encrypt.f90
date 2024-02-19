program Encrypt

    implicit none
    
    ! Parameters
    character(len=93), parameter :: INPUT_STRING = & ! bro lines have sizes??? WHY?
        "You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice."
    integer, parameter :: ALPHABET_SIZE = 26
    integer, parameter :: SHIFT = 46
    
    ! Variables
    character(len=len(INPUT_STRING)) :: encrypted_string
    integer :: i
    integer :: strLen
    ! Calculate length of input string
    strLen = len_trim(INPUT_STRING)
    
    ! Encrypt the string
    do i = 1, strLen
        if (INPUT_STRING(i:i) >= 'A' .and. INPUT_STRING(i:i) <= 'Z') then
            encrypted_string(i:i) = char(mod(ichar(INPUT_STRING(i:i)) - ichar('A') + SHIFT, ALPHABET_SIZE) + ichar('A'))
        else if (INPUT_STRING(i:i) >= 'a' .and. INPUT_STRING(i:i) <= 'z') then
            encrypted_string(i:i) = char(mod(ichar(INPUT_STRING(i:i)) - ichar('a') + SHIFT, ALPHABET_SIZE) + ichar('a'))
        else
            encrypted_string(i:i) = INPUT_STRING(i:i)
        end if
    end do
    
    ! Print encrypted string
    print *, "Original: ", INPUT_STRING
    print *, "Encrypted: ", encrypted_string
    
end program Encrypt