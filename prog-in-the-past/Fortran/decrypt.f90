program Decrypt
    implicit none
    
    ! Parameters
    character(len=93), parameter :: INPUT_STRING = &
        "Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq."
    integer, parameter :: ALPHABET_SIZE = 26
    integer, parameter :: SHIFT = 12
    
    ! Variables
    character(len=len(INPUT_STRING)) :: decrypted_string
    integer :: i
    integer :: strLen
    
    ! Calculate length of input string
    strLen = len_trim(INPUT_STRING)
    
    ! Decrypt the string
    do i = 1, strLen
        if (INPUT_STRING(i:i) >= 'A' .and. INPUT_STRING(i:i) <= 'Z') then
            decrypted_string(i:i) = char(mod(ichar(INPUT_STRING(i:i)) - ichar('A') - &
                SHIFT + ALPHABET_SIZE, ALPHABET_SIZE) + ichar('A'))
        else if (INPUT_STRING(i:i) >= 'a' .and. INPUT_STRING(i:i) <= 'z') then
            decrypted_string(i:i) = char(mod(ichar(INPUT_STRING(i:i)) - ichar('a') - & 
                SHIFT + ALPHABET_SIZE, ALPHABET_SIZE) + ichar('a'))
        else
            decrypted_string(i:i) = INPUT_STRING(i:i)
        end if
    end do
    
    ! Print decrypted string
    print *, "Encrypted: ", INPUT_STRING
    print *, "Decrypted: ", decrypted_string
    
end program Decrypt
